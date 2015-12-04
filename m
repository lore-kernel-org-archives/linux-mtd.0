Received: from mail-pa0-x22f.google.com ([2607:f8b0:400e:c03::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a4znJ-0005HO-6Q
 for linux-mtd@lists.infradead.org; Fri, 04 Dec 2015 23:29:42 +0000
Received: by pacdm15 with SMTP id dm15so93584223pac.3
 for <linux-mtd@lists.infradead.org>; Fri, 04 Dec 2015 15:29:20 -0800 (PST)
Received: from google.com ([2620:0:1000:1301:1dbc:87c4:295d:6446])
 by smtp.gmail.com with ESMTPSA id pb9sm19315496pac.38.2015.12.04.15.29.19
 for <linux-mtd@lists.infradead.org>
 (version=TLS1_2 cipher=AES128-SHA bits=128/128);
 Fri, 04 Dec 2015 15:29:19 -0800 (PST)
Date: Fri, 4 Dec 2015 15:29:17 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: partitions: turn PART() macro into inline function
Message-ID: <20151204232917.GF120110@google.com>
References: <1447990119-128216-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1447990119-128216-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 19, 2015 at 07:28:39PM -0800, Brian Norris wrote:
> We can guard against reorganization of struct mtd_part by using
> container_of(). We can also make sure we're using the right pointer
> types by making this a static inline function instead of a macro.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

Pushed to l2-mtd.git
