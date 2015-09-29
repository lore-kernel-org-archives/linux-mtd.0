Received: from mail-pa0-x22d.google.com ([2607:f8b0:400e:c03::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zh1Ju-0001N9-OD
 for linux-mtd@lists.infradead.org; Tue, 29 Sep 2015 20:16:15 +0000
Received: by pacfv12 with SMTP id fv12so15783994pac.2
 for <linux-mtd@lists.infradead.org>; Tue, 29 Sep 2015 13:15:54 -0700 (PDT)
Date: Tue, 29 Sep 2015 13:15:51 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Tom Englund <tomenglund26@gmail.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH 1/1] pcmciamtd: Add id for PRETEC 4MB SRAM
Message-ID: <20150929201551.GI31505@google.com>
References: <1442605379-27627-1-git-send-email-tomenglund26@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1442605379-27627-1-git-send-email-tomenglund26@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Sep 18, 2015 at 09:42:59PM +0200, Tom Englund wrote:
> The module pcmciamtd doesn't generate a mtd node for PRETEC 4MB SRAM
> cards without the id and hash added to pcmciamtd.c
> 
> Tested on 3 different 4MB pretec sram cards.
> 
> Signed-off-by: Tom Englund <tomenglund26@gmail.com>

Pushed to l2-mtd.git
