Received: from mail-pa0-x22a.google.com ([2607:f8b0:400e:c03::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZwdXD-0001Kh-3q
 for linux-mtd@lists.infradead.org; Wed, 11 Nov 2015 22:06:31 +0000
Received: by pabfh17 with SMTP id fh17so42684993pab.0
 for <linux-mtd@lists.infradead.org>; Wed, 11 Nov 2015 14:06:10 -0800 (PST)
Received: from google.com ([2620:0:1000:1301:b5e8:66ef:5e80:54ae])
 by smtp.gmail.com with ESMTPSA id wh10sm11151277pab.2.2015.11.11.14.06.09
 for <linux-mtd@lists.infradead.org>
 (version=TLSv1.2 cipher=RC4-SHA bits=128/128);
 Wed, 11 Nov 2015 14:06:09 -0800 (PST)
Date: Wed, 11 Nov 2015 14:06:07 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Re: [mtd-utils PATCH] nandtest: support hex/dec/oct for --offset and
 --length
Message-ID: <20151111220607.GA71848@google.com>
References: <1446163921-115867-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1446163921-115867-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Oct 29, 2015 at 05:12:01PM -0700, Brian Norris wrote:
> These two options are handled inconsistently, which caused an
> unnecessary amount of head scratching. Let's just use the simple helpers
> too, so we get the error handling right.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

Pushed to mtd-utils.git
