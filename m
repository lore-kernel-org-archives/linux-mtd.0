Message-ID: <5296B9C5.3060704@freescale.com>
Date: Thu, 28 Nov 2013 11:34:29 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 00/23] mtd: st_spi_fsm: Add new device
References: <1385137380-28968-1-git-send-email-lee.jones@linaro.org>
 <20131127040723.GZ9468@ld-irv-0074.broadcom.com>
 <20131127115226.GC3296@lee--X1>
In-Reply-To: <20131127115226.GC3296@lee--X1>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: angus.clark@st.com, linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 dwmw2@infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2013=E5=B9=B411=E6=9C=8827=E6=97=A5 19:52, Lee Jones =E5=86=99=E9=
=81=93:
> However, as we send entire 'message sequences' to the FSM Controller
> as opposed to merely OPCODEs we would have to extract the OPCODE from
> flash->command[0] and call our own functions to craft the correct
> 'message sequence' for the task. For this reason we rejected the idea
> and went with a stand-alone driver.
>
could you send me the datasheet of your spi nor controller?
I can change my code if it really not good enough.

we can store the opcode to a field, such as spi_nor_write_op.
> The framework which Huang is proposing suffers from the same issues.
> Only providing read(), write(), read_reg() and write_reg() doesn't
> work for our use-case, as we'd have to decode the flash->command[0] and
> invoke our own internal routines as before.
>
> The only framework with would work for us would consist almost all
> of the important functions such as; read(), write(), erase(),
> wait_busy(), read_jedec(), read_status_reg(), write_status_reg(),
> read_control_reg(), write_control_reg(), etc. However, this approach
>  =20
read_jedec() can be replaced by read_reg(0x9f);

read_status() can be replaced by read_reg(0x5);

....

write_control_reg() can be replaced by write_reg(xx).


Please correct me if i am wrong.

IMHO, the current four hooks for spi-nor{} can do all the things.

      read/write/read_reg/write_reg.

thanks
Huang Shijie
