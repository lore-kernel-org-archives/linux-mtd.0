Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QbWbU-0007Pz-WD
	for linux-mtd@lists.infradead.org; Tue, 28 Jun 2011 11:37:17 +0000
Received: by pzk1 with SMTP id 1so82836pzk.16
	for <linux-mtd@lists.infradead.org>;
	Tue, 28 Jun 2011 04:37:13 -0700 (PDT)
Subject: Re: [Ubifs] Reboot -> "recovery needed"?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Gilles <gilles.ganault@free.fr>
Date: Tue, 28 Jun 2011 14:38:04 +0300
In-Reply-To: <gfej07dg451r0l2co91fuvn4k2ujktk1ta@4ax.com>
References: <1rhb079etc7nr1tasfal6eag1d6lmfhd73@4ax.com>
	<1309246418.23597.31.camel@sauron>
	<45ej07pjslh20fb66illqsmn9r0au0fejb@4ax.com>
	<1309260162.23597.66.camel@sauron>
	<gfej07dg451r0l2co91fuvn4k2ujktk1ta@4ax.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1309261088.23597.68.camel@sauron>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-06-28 at 13:25 +0200, Gilles wrote:
> On Tue, 28 Jun 2011 14:22:38 +0300, Artem Bityutskiy
> <dedekind1@gmail.com> wrote:
> >> Thanks for the info. I'll see if I can edit the source code to
> >> "reboot" to unmount the root filesystem, or replace "reboot" with
> >> another application or script.
> >
> >I think it may be enough to re-mount read-only, and probably it is
> >impossible to unmount in many cases. But I am not 100% sure.
> 
> So I could rename "reboot" something else, then write a shell script
> named "reboot" that will first remount the Ubifs partition ro, and
> then call the real "reboot"?

I think it is not that simple - if there is any file open for writing -
remount will fail with EBUSY. So you'd first need to shut down apps,
then do that. You should probably refer standard boot scripts to see
what they do.

On the other hand, as long as your reboot command runs sync, it is
harmless to not unmount UBIFS.

-- 
Best Regards,
Artem Bityutskiy
