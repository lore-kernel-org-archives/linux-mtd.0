Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RaDBP-0006Cy-Ce
 for linux-mtd@lists.infradead.org; Mon, 12 Dec 2011 21:13:12 +0000
Received: by lahc1 with SMTP id c1so685255lah.36
 for <linux-mtd@lists.infradead.org>; Mon, 12 Dec 2011 13:13:09 -0800 (PST)
Subject: Re: [PATCH v3] mtd/docg3: fixes and cleanups
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Date: Mon, 12 Dec 2011 23:13:05 +0200
In-Reply-To: <877h2590zp.fsf@free.fr>
References: <1322726702.2332.9.camel@koala>
 <1322852412-15193-1-git-send-email-robert.jarzmik@free.fr>
 <1323066682.2316.18.camel@koala> <877h2590zp.fsf@free.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Message-ID: <1323724387.2297.13.camel@koala>
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

On Fri, 2011-12-09 at 17:13 +0100, Robert Jarzmik wrote:
> Artem Bityutskiy <dedekind1@gmail.com> writes:
> 
> > On Fri, 2011-12-02 at 20:00 +0100, Robert Jarzmik wrote:
> >> This patch takes into account checkpatch, sparse and ECC
> >> comments.
> >> 
> >> Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
> >
> > Pushed to l2-mtd-2.6.git, thanks. But I still see this warning when
> > I compile on x86_64:
> >
> > drivers/mtd/devices/docg3.c:1050:12: warning: ‘doc_get_erase_count’ defined
> > but not used [-Wunused-function]
> 
> Hi Artem,
> 
> I have found no clean and good way to handle the erase count.  As a fallback,
> please accept the following patch which removes the unused function. It's kind
> of a "looser" approach, but that's the best I can do by now.

What do you mean by "handle" ? Is the problem that docg3 maintains
per-eraseblock erase-counters and you do not know how to use them? May
be it is better to just embrace this function with "#ifdef 0" and add a
comment that we can do this but do not have a good use for this?

Artem.
