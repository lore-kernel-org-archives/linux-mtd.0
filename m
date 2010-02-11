Received: from mail-px0-f201.google.com ([209.85.216.201])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NffZ7-0001rg-W9
	for linux-mtd@lists.infradead.org; Thu, 11 Feb 2010 20:23:15 +0000
Received: by pxi39 with SMTP id 39so560319pxi.2
	for <linux-mtd@lists.infradead.org>;
	Thu, 11 Feb 2010 12:23:08 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1265872946.2529.3770.camel@macbook.infradead.org>
References: <8c675e9b1002102157p33e4e7fg3239c62642bc008e@mail.gmail.com>
	<1265872946.2529.3770.camel@macbook.infradead.org>
From: Amol Lad <amol.lad@gmail.com>
Date: Fri, 12 Feb 2010 09:22:48 +1300
Message-ID: <8c675e9b1002111222ibfe32b6p4c513262a10ac518@mail.gmail.com>
Subject: Re: JFFS2 mount fail & crash on 2.4.26 kernel
To: David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Sorry for non giving enough information. The devices are in the field
since last 5 years and never showed problems. (This shows the
robustness of jffs2 fs). Recently only some devices are approaching
90% usage and this problem showed up....

It will be completely unfair to ask for any fix on such an old kernel.
So any ideas on recovery will help before I push RED button (i.e. call
the devices back to factory and re-flash jffs2 image..)

Do we have any tool like fsck that can be used for recovery? (I tried
mounting the device after these errors and crash, but mount hangs and
never returns. "ps" shows mount in "D" state)

On Thu, Feb 11, 2010 at 8:22 PM, David Woodhouse <dwmw2@infradead.org> wrot=
e:
> On Thu, 2010-02-11 at 18:57 +1300, Amol Lad wrote:
>> (We've patched jffs2 in 2.4.26 from mtd cvs snapshot dated
>> 11/20/2004).
>
> Hahaha.
>
> April 1st isn't for another few weeks.
>
> --
> David Woodhouse =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0Op=
en Source Technology Centre
> David.Woodhouse@intel.com =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0Intel Corporation
>
>



--=20
Real men program in C

Sent from Wellington, Wgn, New Zealand
