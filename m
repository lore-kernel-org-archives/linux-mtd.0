Message-ID: <529707C3.40208@st.com>
Date: Thu, 28 Nov 2013 09:07:15 +0000
From: Angus Clark <angus.clark@st.com>
MIME-Version: 1.0
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH 00/23] mtd: st_spi_fsm: Add new device
References: <1385137380-28968-1-git-send-email-lee.jones@linaro.org>
 <20131127040723.GZ9468@ld-irv-0074.broadcom.com>
 <20131127115226.GC3296@lee--X1> <5296B9C5.3060704@freescale.com>
In-Reply-To: <5296B9C5.3060704@freescale.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Cc: Lee Jones <lee.jones@linaro.org>, linus.walleij@linaro.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Huang Shijie,

On 11/28/2013 03:34 AM, Huang Shijie wrote:
> 于 2013年11月27日 19:52, Lee Jones 写道:
>> However, as we send entire 'message sequences' to the FSM Controller
>> as opposed to merely OPCODEs we would have to extract the OPCODE from
>> flash->command[0] and call our own functions to craft the correct
>> 'message sequence' for the task. For this reason we rejected the idea
>> and went with a stand-alone driver.
>>
> could you send me the datasheet of your spi nor controller?
> I can change my code if it really not good enough.

I will reply to the "mtd: spi-nor" thread regarding the proposed framework, but
a couple of answers to your specific questions below.

> 
> we can store the opcode to a field, such as spi_nor_write_op.
>> The framework which Huang is proposing suffers from the same issues.
>> Only providing read(), write(), read_reg() and write_reg() doesn't
>> work for our use-case, as we'd have to decode the flash->command[0] and
>> invoke our own internal routines as before.
>>
>> The only framework with would work for us would consist almost all
>> of the important functions such as; read(), write(), erase(),
>> wait_busy(), read_jedec(), read_status_reg(), write_status_reg(),
>> read_control_reg(), write_control_reg(), etc. However, this approach
>>   
> read_jedec() can be replaced by read_reg(0x9f);
> 
> read_status() can be replaced by read_reg(0x5);
> 
> ....
> 
> write_control_reg() can be replaced by write_reg(xx).

Unfortunately the H/W Controller in question comes with a few restrictions.  One
restriction is that data must be read in multiples of 4 bytes.  As such, it
would not be able to honour a call of "flash->read_reg(flash, OPCODE_RDID, id, 5);"

Of course, if the H/W driver knows that we are issuing a read_jedec() operation,
then it can make the assumption that over-reading is benign, and we can instead
read 8 bytes of data from the Flash device, and return 5 to the caller.
However, without knowing what operation is being requested, no such assumption
can be made.

> Please correct me if i am wrong.
> 
> IMHO, the current four hooks for spi-nor{} can do all the things.
> 
>      read/write/read_reg/write_reg.

As it stands, the spi-nor framework cannot support the requirements of the
st_spi_fsm controller.  I will go into further details on the "mtd: spi-nor" thread.

Cheers,

Angus


-- 
-------------------------------------
Angus Clark
ST Microelectronics (R&D) Ltd.
1000 Aztec West, Bristol, BS32 4SQ
email: angus.clark@st.com
tel: +44 (0) 1454 462389
st-tina: 065 2389
-------------------------------------
