Received: from mail-pd0-x22d.google.com ([2607:f8b0:400e:c02::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YevVk-0003Re-TV
 for linux-mtd@lists.infradead.org; Mon, 06 Apr 2015 01:07:34 +0000
Received: by pdbni2 with SMTP id ni2so28547729pdb.1
 for <linux-mtd@lists.infradead.org>; Sun, 05 Apr 2015 18:07:11 -0700 (PDT)
Date: Sun, 5 Apr 2015 18:07:08 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: docg3: remove invalid __exit annotations
Message-ID: <20150406010708.GJ2677@norris-Latitude-E6410>
References: <1427820817-9446-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1427820817-9446-1-git-send-email-computersforpeace@gmail.com>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Mar 31, 2015 at 09:53:37AM -0700, Brian Norris wrote:
> The .remove callback may be used when detaching a device via sysfs, so
> we can't expect to free up this memory.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> Cc: Robert Jarzmik <robert.jarzmik@free.fr>

Pushed to l2-mtd.git.

Brian
