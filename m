Received: from tux.runtux.com ([176.9.82.136])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c8Qo0-0001Mj-It
 for linux-mtd@lists.infradead.org; Sun, 20 Nov 2016 12:01:09 +0000
Received: from localhost (localhost [127.0.0.1])
 by tux.runtux.com (Postfix) with ESMTP id 15F616F0E1
 for <linux-mtd@lists.infradead.org>; Sun, 20 Nov 2016 13:00:43 +0100 (CET)
Received: from tux.runtux.com ([127.0.0.1])
 by localhost (tux2.runtux.com [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id VyhpbnKQaBXD for <linux-mtd@lists.infradead.org>;
 Sun, 20 Nov 2016 13:00:34 +0100 (CET)
Received: from bee.priv.zoo (91-118-140-5.dsl.dynamic.surfer.at [91.118.140.5])
 (Authenticated sender: postmaster@runtux.com)
 by tux.runtux.com (Postfix) with ESMTPSA id 350B16F028
 for <linux-mtd@lists.infradead.org>; Sun, 20 Nov 2016 13:00:31 +0100 (CET)
Date: Sun, 20 Nov 2016 13:00:30 +0100
From: Ralf Schlatterbeck <rsc@runtux.com>
To: linux-mtd@lists.infradead.org
Subject: Re: init_constants_early: too small LEBs?
Message-ID: <20161120120029.GA1220@runtux.com>
References: <20161119212508.GA5237@runtux.com>
 <20161120105141.69e66105@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161120105141.69e66105@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Nov 20, 2016 at 10:51:41AM +0100, Boris Brezillon wrote:
> On Sat, 19 Nov 2016 22:25:08 +0100
> Ralf Schlatterbeck <rsc@runtux.com> wrote:
> 
> > I'm trying to get an ubifs on a 2MB NOR flash.
> 
> Why not putting JFFS2 directly on your MTD device (no UBI in the
> middle).
> 
> > I'd really like to be bad block tolerant but
> > don't know if this makes sense with NOR-Flash (of this size) at all.
> 
> You shouldn't need UBI, AFAIR, JFFS2 already deals with
> wear-leveling/bad-block problems.

I also need to reinitialize the complete filesystem if something is
inconsistent from a known-good source (in that case on a NAND flash).
The idea was to ubiformat everything (which preserves wear counters) and
re-create the filesystem on top of it (and in the first place I thought
I'd use ubifs). I don't think there is a way to re-create a jffs *and*
preserving wear counters?

Thanks
Ralf
-- 
Dr. Ralf Schlatterbeck                  Tel:   +43/2243/26465-16
Open Source Consulting                  www:   http://www.runtux.com
Reichergasse 131, A-3411 Weidling       email: office@runtux.com
