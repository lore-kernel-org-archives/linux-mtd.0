Received: from mail-pa0-x230.google.com ([2607:f8b0:400e:c03::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZhSIl-0004Sb-OC
 for linux-mtd@lists.infradead.org; Thu, 01 Oct 2015 01:04:52 +0000
Received: by pacfv12 with SMTP id fv12so57508833pac.2
 for <linux-mtd@lists.infradead.org>; Wed, 30 Sep 2015 18:04:30 -0700 (PDT)
Date: Wed, 30 Sep 2015 18:04:28 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Kirill Smirnov <kirill.k.smirnov@gmail.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd-utils: serve_image: use proper POSIX_C_SOURCE value
Message-ID: <20151001010428.GA12956@google.com>
References: <560C7518.4050004@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <560C7518.4050004@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Oct 01, 2015 at 02:49:44AM +0300, Kirill Smirnov wrote:
> struct addrinfo and friends conform to POSIX.1-2001, not earlier.
> This patch fixes linking against latest glibc 2.22

Please include your 'Signed-off-by', and use inline patches, not
attachments. For reference, see the Linux patch submission guidelines:

https://www.kernel.org/doc/Documentation/SubmittingPatches
