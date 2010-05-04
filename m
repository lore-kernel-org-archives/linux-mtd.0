Received: from krynn.se.axis.com ([193.13.178.10])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O9GYK-00086M-I1
	for linux-mtd@lists.infradead.org; Tue, 04 May 2010 11:44:41 +0000
Date: Tue, 4 May 2010 13:44:35 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Murali N <nalajala.murali@gmail.com>
Subject: Re: unable to run "flash_eraseall" on ARM target!!!
In-Reply-To: <t2q630851df1005040439hf116acd1ucd73738e90dc5731@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.1005041343380.16385@lnxricardw.se.axis.com>
References: <t2q630851df1005040439hf116acd1ucd73738e90dc5731@mail.gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Tue, 4 May 2010, Murali N wrote:

> Hi,
> i have compiled the mtd-utils for android using arm-eabi-4.4.0 tool chain=
=2E
> I tried erasing the flash using "flash_eraseall" on target but i am
> getting the below errors!!!
>
> # sh ./flash_eraseall
>     sh ./flash_eraseall
>     ./flash_eraseall: 1: Syntax error: word unexpected (expecting ")")
> # ./flash_eraseall
>    ./flash_eraseall
>    ./flash_eraseall: not found
> # sh /data/flash_eraseall
>    sh /data/flash_eraseall
>    /data/flash_eraseall: 1: Syntax error: word unexpected (expecting ")")
> #
>
> Why "flash_eraseall" was not found? i am running from the same
> directory where i have copied.

Have you made flash_eraseall executable? Looks like you've just copied it=
=20
without doing   chmod +x flash_eraseall  afterwards.

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
