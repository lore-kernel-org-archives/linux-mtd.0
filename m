Subject: Re: [PATCH 2/2] mtd: spi-nor: add rockchip serial flash controller
 driver
To: Shawn Lin <shawn.lin@rock-chips.com>, Rob Herring <robh+dt@kernel.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
References: <1478855766-151673-1-git-send-email-shawn.lin@rock-chips.com>
 <1478855766-151673-3-git-send-email-shawn.lin@rock-chips.com>
 <b1420e9d-b6a1-7fe8-4381-e32e0bc7dd53@gmail.com>
 <775a8918-bc93-218a-808d-2a160137ad56@rock-chips.com>
 <8f8213a1-f694-8159-fdbd-5e607c8aaaa2@gmail.com>
 <76670120-dacd-ef0e-cf36-cbf549b19853@rock-chips.com>
Cc: devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <b513a489-5913-ffe8-69f1-7201943a05a3@gmail.com>
Date: Fri, 25 Nov 2016 14:54:24 +0100
MIME-Version: 1.0
In-Reply-To: <76670120-dacd-ef0e-cf36-cbf549b19853@rock-chips.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/21/2016 03:51 AM, Shawn Lin wrote:
> Hi Marek,

Hi!

[...]

>>> sfc->num_chip stands for how many flashes registered successfully.
>>
>> Does it work if you have a hole in there ? Like if you have a flash on
>> chipselect 0 and chipselect 2 ?
> 
> Yes it does, as it won't leave a room for chipselect 1 whose node isn't
> present, which means there isn't a hole in there at all. :)

Ah , because you are not indexing those NORs with their CS number , right ?


-- 
Best regards,
Marek Vasut
