Received: from post2.inre.asu.edu ([129.219.110.73])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 173Cwr-0003Ks-00
	for <linux-mtd@lists.infradead.org>; Thu, 02 May 2002 10:32:25 +0100
Received: from conversion.post2.inre.asu.edu by asu.edu (PMDF V6.1 #40111)
 id <0GVH00B0195W0U@asu.edu> for linux-mtd@lists.infradead.org; Thu,
 02 May 2002 02:32:20 -0700 (MST)
Date: Thu, 02 May 2002 02:32:26 -0700
From: Russ Dill <Russ.Dill@asu.edu>
Subject: Re: Booting from DOC2000 with GRUB loader
In-reply-to: <02050209075601.08259@diva.localdomain>
To: John Sutton <john@scl.co.uk>
Cc: linux-mtd@lists.infradead.org
Message-id: <1020331947.19824.3160.camel@russ>
MIME-version: 1.0
Content-type: text/plain
Content-transfer-encoding: 7bit
References: <02050120383503.07252@diva.localdomain>
 <02050209075601.08259@diva.localdomain>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Thu, 2002-05-02 at 00:47, John Sutton wrote:
> Hi again
> 
> Many thanks for all that feedback!  Definitely a positive consensus
> about the units for start_offset ;-)
> 
> Jasmine suggests that I should leave some extra after the end of grub for
> future expansion, which seems a good idea, but raises in my mind the
> question as to how grub (or anything else) knows where the nftl partition
> starts?  Does nftl_format also write a pointer to the start block
> somewhere else?  Or does the format contain some kind of signature?

just sure to erase any unused sectors.


nftl looks for a media header signiture

> Re the suggestions as to how to recover from an unbootable system!  To
> an old fool like me, the idea of pushing a chip into a live board makes my
> hair curl!  Anyways, I hope it doesn't come to that as it would in my case
> be extremely difficult, if not impossible - I'm using an SBC plugged into
> a passive backplane and the DoC socket is right at the bottom next to the
> edge connector ;-(

maybe something in bios could help (shadow regions, etc)
