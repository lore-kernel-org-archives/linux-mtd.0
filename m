Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OnoWO-0003ql-GE
	for linux-mtd@lists.infradead.org; Tue, 24 Aug 2010 08:06:17 +0000
Received: by fxm12 with SMTP id 12so4413715fxm.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 24 Aug 2010 01:06:15 -0700 (PDT)
Subject: Re: Is repartitioning possible while one of the partitions is mounted?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Tim Cussins <timcussins@eml.cc>
In-Reply-To: <1280755953.2174.24.camel@pc816>
References: <1280755953.2174.24.camel@pc816>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 24 Aug 2010 11:04:46 +0300
Message-ID: <1282637086.24044.133.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On Mon, 2010-08-02 at 14:32 +0100, Tim Cussins wrote:
> Hi all,
> 
> I just spotted post regarding upcoming Runtime Partitioning Support
> (http://lists.infradead.org/pipermail/linux-mtd/2010-July/031200.html)
> 
> After taking a cursory glance at the patch it's not immediately obvious
> ( uh, to me anyway :D ) whether you can create/delete partitions while
> a filesystem (e.g. rootfs) is mounted from another partition on the same
> mtd device.
> 
> Under what conditions can you create/delete partitions?

I guess it is good idea to put the authors of that patch in CC, no?

I think this case should be handled. If it is not, the solution is not
very good. But this is just IMHO.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
