Received: from mail-iw0-f177.google.com ([209.85.214.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PqO3k-0003GJ-Qe
	for linux-mtd@lists.infradead.org; Fri, 18 Feb 2011 10:59:37 +0000
Received: by iwn38 with SMTP id 38so3405675iwn.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 18 Feb 2011 02:59:34 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <AANLkTinSUdKvfN3eRgmRVmL6ZqKXDWMgtQCR_5dyRr7b@mail.gmail.com>
References: <AANLkTikxCVO5Qs4amo1cCgnYVD3fYZdKh2in4e+X5EFV@mail.gmail.com>
	<1297002281.4460.6.camel@localhost>
	<AANLkTi=M58XrQYEhN1JGX3brBu2aV5h=oAv+Wb9oe46q@mail.gmail.com>
	<AANLkTinUJUqgX00UiMHjF5bR_avNLQWuWscfCb+1E2Lf@mail.gmail.com>
	<AANLkTinSUdKvfN3eRgmRVmL6ZqKXDWMgtQCR_5dyRr7b@mail.gmail.com>
Date: Fri, 18 Feb 2011 11:59:32 +0100
Message-ID: <AANLkTi=SjbZo799PZ5SoEVdLV5J5CwHFZPDTXvo1mJch@mail.gmail.com>
Subject: Re: Testing a device using mtd_stresstest
From: Arno Steffen <arno.steffen@googlemail.com>
To: David Peverley <pev@sketchymonkey.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2011/2/10 David Peverley <pev@sketchymonkey.com>:
> Hi Arno,
>
> Is the patch you refer to the addition of dmb() to nand_command_lp()
> that I found discussed on TI's E2E board? :
> =A0http://e2e.ti.com/support/embedded/f/354/p/56710/234039.aspx
>
> Digging around I managed to find someones GIT commit with some descriptio=
n at :
> =A0http://arago-project.org/git/people/?p=3Dsriram/ti-psp-omap.git;a=3Dco=
mmitdiff;h=3D76319aa1a321c4b5981e412bf489cfb617186c2f
>

Yepp, that's exactly what helps me. Before that patch it was a nightmare.

I still have one issue with jffs2 - and I don't know - which of the
behaviours is right or wrong.
Generating a jffs2 will end with data , lets say at 0x140 (it's an
almost empty filesystem).  Rest of partition is 0xff. If I do changes
in filesystem it writes blocks of 0x800 bytes, and the not used data
are set to 0x00.
And then I get a message from mdt module, that there is empty flash
between 0x140 and 0x800. As kernel writes always blocks of 0x800 byte,
this message will not occure here.
So does my mkfs.jffs2 should pad from 0x140 .. 0x800 with 0x00 to work
properly? Or does my kernel / mtd driver misbehaves ?
I am courious whether you know, what is right or wrong.
