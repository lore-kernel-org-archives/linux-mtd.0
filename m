Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P7mt9-0001lF-R7
	for linux-mtd@lists.infradead.org; Mon, 18 Oct 2010 10:24:21 +0000
Received: by fxm15 with SMTP id 15so463187fxm.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 18 Oct 2010 03:24:17 -0700 (PDT)
Subject: Re: RE : UBI/UBIFS interrupted write page handling
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Matthieu CASTET <matthieu.castet@parrot.com>
In-Reply-To: <4CA9D2A0.6010508@parrot.com>
References: <4C88DDD5.4060507@parrot.com>
	<1284054669.11335.21.camel@brekeke> <1285006478.1762.1.camel@brekeke>
	<4C9B7CD8.4070806@parrot.com>,<1285266914.1766.1.camel@brekeke>
	<F5C24FC168F95048BB6B9E0B13EB33152BA6F5304E@DIAMANT.xi-lite.lan>
	<1285523911.1776.9.camel@brekeke> <1285657088.2437.23.camel@localhost>
	<4CA19DAE.7030402@parrot.com> <1285660934.2437.44.camel@localhost>
	<4CA9D2A0.6010508@parrot.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 18 Oct 2010 13:21:13 +0300
Message-ID: <1287397273.1972.37.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-10-04 at 15:12 +0200, Matthieu CASTET wrote:
> Artem Bityutskiy a écrit :
> > On Tue, 2010-09-28 at 09:47 +0200, Matthieu CASTET wrote:
> >> Artem Bityutskiy a écrit :
> >>> On Sun, 2010-09-26 at 20:58 +0300, Artem Bityutskiy wrote:
> >>>
> >> That's better : interrupt erased page are not put anymore in corrupted list.
> >> But I have problem with interrupt write :
> >> this night the test crashed [1].
> > 
> > Yeah, this should be fixed by forcing LEB refresh for the last LEBs of
> > journal heads. This problem exists long time. I'll work on this and send
> > you patches.
> UBI will need also some patch.
> For example in case of wear leveling, ubi could move a leb from a peb to 
> another and the write can be interrupted.

Hmm, yeah, we have CRC in this case and we rely on CRC. However, if the
write to the last page was interrupted, it can be unstable and can
sometimes be read correctly, but sometimes incorrectly. So UBI should
refresh such PEBs.

I guess it is easier to start with UBI first.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
