Received: from mail.linuxfoundation.org ([140.211.169.12])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YUCQi-0002HL-OC
 for linux-mtd@lists.infradead.org; Sat, 07 Mar 2015 10:58:01 +0000
Date: Fri, 6 Mar 2015 15:59:19 -0800
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Frans Klaver <fransklaver@gmail.com>
Subject: Re: [PATCH 60/60] staging: mt29f_spinand: show device in sysfs
Message-ID: <20150306235919.GA17068@kroah.com>
References: <1425418844-25177-1-git-send-email-fransklaver@gmail.com>
 <1425418844-25177-61-git-send-email-fransklaver@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1425418844-25177-61-git-send-email-fransklaver@gmail.com>
Cc: linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Mar 03, 2015 at 10:40:44PM +0100, Frans Klaver wrote:
> Fix a bug where mtd devices aren't shown in sysfs.
> 
> While at it, take advantage of the default owner and name values set by
> mtdcore.
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Frans Klaver <fransklaver@gmail.com>
> ---
>  drivers/staging/mt29f_spinand/mt29f_spinand.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
