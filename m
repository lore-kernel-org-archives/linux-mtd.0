Date: Thu, 22 Jan 2009 07:33:20 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: JFFS2 losing files on mount
In-Reply-To: <1232597019.3921.2.camel@macbook.infradead.org>
Message-ID: <Pine.LNX.4.64.0901220725490.1706@lnxricardw.se.axis.com>
References: <d459bb380901210129sb54eb47j2a67a11710f185b5@mail.gmail.com>
	<Pine.LNX.4.64.0901211603040.12232@lnxricardw.se.axis.com>
	<1232597019.3921.2.camel@macbook.infradead.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: Marco Braga <marco.braga@gmail.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Thu, 22 Jan 2009, David Woodhouse wrote:

>> We use JFFS2 on both an ARM9-platform and on our own CRIS platform. We
>> never unmount the device in preparation for power down; when someone pul=
ls
>> the plug, the system just dies. While we do occasionally see warning
>> messages about incomplete nodes during the next boot-up, we have never
>> experienced anything as severe as you mention, and we have not lost any
>> files on the JFFS2 filesystem either.
>
> Is this on NAND, or NOR flash? On NAND flash, you do actually have to
> have non-buggy userspace; if you don't use sync() or fsync()
> appropriately then there may be data which aren't yet flushed to the
> flash.

To be more specific, on NOR flash we never say any messages about bad data=
=20
nodes. With NAND flashes we do. However, we have never experienced missing=
=20
files the way Marco seems to have.

What's the situation though, assuming one doesn't use sync()/fsync(),
I can understand that data won't get flushed properly, but would that=20
result in a file being lost?

In our case, the device may be powered down at any time. Let's assume an=20
application has a lot of data to write, using several write() calls. I can=
=20
envisage two scenarios:
1. Userspace app writes all data, but fails to call sync/fsync before
    power fails.
2. Userspace app writes some of its data, but power fails before it
    has time to write all.

In both cases I would imagine that the end result is the same - all data
is not written to the flash because the plug is pulled. Considering the=20
data in the file, it doesn't matter if it wasn't written out by JFFS2 or=20
becuase the application died to early. Or is this a faulty assumption?

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
