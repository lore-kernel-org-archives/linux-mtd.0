Received: from mail-pv0-f177.google.com ([74.125.83.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QbWMb-00075m-Mm
	for linux-mtd@lists.infradead.org; Tue, 28 Jun 2011 11:21:54 +0000
Received: by pvg20 with SMTP id 20so4910pvg.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 28 Jun 2011 04:21:47 -0700 (PDT)
Subject: Re: [Ubifs] Reboot -> "recovery needed"?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Gilles <gilles.ganault@free.fr>
Date: Tue, 28 Jun 2011 14:22:38 +0300
In-Reply-To: <45ej07pjslh20fb66illqsmn9r0au0fejb@4ax.com>
References: <1rhb079etc7nr1tasfal6eag1d6lmfhd73@4ax.com>
	<1309246418.23597.31.camel@sauron>
	<45ej07pjslh20fb66illqsmn9r0au0fejb@4ax.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1309260162.23597.66.camel@sauron>
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

On Tue, 2011-06-28 at 13:19 +0200, Gilles wrote:
> On Tue, 28 Jun 2011 10:33:34 +0300, Artem Bityutskiy
> <dedekind1@gmail.com> wrote:
> >Your reboot command does not unmount the file-system, so from UBIFS's
> >point of view you do unclean reboot, and UBIFS needs to do recovery.
> 
> Thanks for the info. I'll see if I can edit the source code to
> "reboot" to unmount the root filesystem, or replace "reboot" with
> another application or script.

I think it may be enough to re-mount read-only, and probably it is
impossible to unmount in many cases. But I am not 100% sure.

-- 
Best Regards,
Artem Bityutskiy
