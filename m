Date: Sat, 21 Jun 2008 13:46:55 +0100 (BST)
From: Artem Bityutskiy <dedekind@infradead.org>
To: Haavard Skinnemoen <haavard.skinnemoen@atmel.com>
Subject: Re: ubifs and losetup
In-Reply-To: <20080620100715.3950ad73@hskinnemo-gx745.norway.atmel.com>
Message-ID: <alpine.LFD.1.10.0806211343050.2833@casper.infradead.org>
References: <6B5648EA2E2C2D42AF2FF7691522AD92417B68@wpr01.wprmedical.local>
	<20080620100715.3950ad73@hskinnemo-gx745.norway.atmel.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Cc: Eirik Aanonsen <eaa@wprmedical.com>, linux-mtd@lists.infradead.org,
	kernel@avr32linux.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 20 Jun 2008, Haavard Skinnemoen wrote:
>> ~ # losetup -o 4096 /dev/loop0 /media/usb
>> losetup: /dev/loop0: Invalid argument
>
> Looks like UBIFS doesn't support loopback devices. Is that right?

Right. Just added this FAQ entry:
http://www.linux-mtd.infradead.org/faq/ubifs.html#L_loop_mount

--
Artem
