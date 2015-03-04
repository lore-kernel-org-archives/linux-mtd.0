Received: from mail-pa0-x235.google.com ([2607:f8b0:400e:c03::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YTEOZ-0002OX-Th
 for linux-mtd@lists.infradead.org; Wed, 04 Mar 2015 18:51:48 +0000
Received: by padfa1 with SMTP id fa1so29507054pad.3
 for <linux-mtd@lists.infradead.org>; Wed, 04 Mar 2015 10:51:25 -0800 (PST)
Date: Wed, 4 Mar 2015 10:51:19 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Daniel Ehrenberg <dehrenberg@chromium.org>
Subject: Re: [PATCH v2] mtd-utils: Add nandpart to add/delete partition
Message-ID: <20150304185119.GL18140@ld-irv-0074>
References: <1423520026-27068-1-git-send-email-namnguyen@chromium.org>
 <CAAK6Zt1YM+bBKwkEZ2nT5iWYaL0HOvfTWj_xAq+5fp4spcZJXA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAK6Zt1YM+bBKwkEZ2nT5iWYaL0HOvfTWj_xAq+5fp4spcZJXA@mail.gmail.com>
Cc: "Nam T. Nguyen" <namnguyen@chromium.org>,
 Mike Frysinger <vapier@chromium.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Mar 04, 2015 at 10:45:44AM -0800, Daniel Ehrenberg wrote:
> On Mon, Feb 9, 2015 at 2:13 PM, Nam T. Nguyen <namnguyen@chromium.org> wrote:
> > Add a simple utility to exercise BLKPG ioctl.
> >
> > Signed-off-by: Nam T. Nguyen <namnguyen@chromium.org>
> 
> Suggestion: rename to flash_part.c . This utility is not
> nand-specific, and flash_ is used for general MTD utilities.

Agreed.

Brian
