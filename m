Subject: Re: [U-Boot] Older u-boot mangles UBI from ubinize 1.5.2
References: <3e1a26f3-5539-01c5-0755-aea07c95d08a@jmomo.net>
 <CAFLxGvyfLdS3cBqoicS02NymT+BAq8B3tKsFzte7Am_4AW0qQA@mail.gmail.com>
 <57AD51FC.9090603@denx.de>
Cc: "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 lede-dev@lists.infradead.org,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
From: J Mo <jmomo@jmomo.net>
Message-ID: <54f74c29-3c28-7cd7-2d6e-77fb09a768c1@jmomo.net>
Date: Thu, 11 Aug 2016 22:13:42 -0700
MIME-Version: 1.0
In-Reply-To: <57AD51FC.9090603@denx.de>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


It's all moot now! I accidentally wrecked my u-boot today.

I typoed "nand write ${fileaddr} ${BOOTCONFIG_nand_addr} ${0x800}"

When I meant "0x800" instead of the undefined "${0x800}", which u-boot 
translated to 0xacc0000.

I guess I'm going to find out if that JTAG header works.
