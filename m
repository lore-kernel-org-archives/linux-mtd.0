Received: from mail-out.m-online.net ([212.18.0.9])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PNSFB-000565-AO
	for linux-mtd@lists.infradead.org; Tue, 30 Nov 2010 15:35:57 +0000
Date: Tue, 30 Nov 2010 16:35:41 +0100
From: Anatolij Gustschin <agust@denx.de>
To: Norbert van Bolhuis <nvbolhuis@aimvalley.nl>
Subject: Re: UBIFS partition on NOR flash not mountable after power cut test
Message-ID: <20101130163541.44c48a94@wker>
In-Reply-To: <4CF4D4CA.8040906@aimvalley.nl>
References: <20101129195014.19224240@wker>
	<4CF4D4CA.8040906@aimvalley.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Eric_Holmberg@Trimble.com, linux-mtd@lists.infradead.org,
	Detlev Zundel <dzu@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Norbert,

On Tue, 30 Nov 2010 11:41:14 +0100
Norbert van Bolhuis <nvbolhuis@aimvalley.nl> wrote:

> Did you read the mail discussions
> "UBIFS Corrupt during power failure"
> dated april 2009 from Eric Holmberg.
> 
> He did some great work in making UBIFS on NOR flash
> more reliable for power-cuts.

I have partially read the thread "UBIFS Corrupt during power 
failure", especially the discussion from March, May, June and July
2009 but not the whole discussion from April.

> One of the problems was UBI/UBIFS assumes a (CFI) write
> buffer size of 8 bytes. Maybe this is still the case.
> I think for your NOR flash it is 64 bytes though.

Thanks for the hint!

Yes, I remember Eric saying that he used 8 byte write buffers but
still had some failures. Therefore I didn't try to reduce the write
buffer size up to now. But these problems seem to be fixed meanwhile.

The write buffer size used in the CFI driver is indeed 64 bytes. Now
I'm running the tests with write buffer size reduced to 8 bytes and
it looks much better now. After 295 test cycles I haven't seen the
issue so far.

Thanks again,
Anatolij

--
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-0 Fax: +49-8142-66989-80  Email: office@denx.de
