Received: from mail-pd0-x22b.google.com ([2607:f8b0:400e:c02::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yy7Qb-0001jM-PU
 for linux-mtd@lists.infradead.org; Thu, 28 May 2015 23:41:34 +0000
Received: by pdbqa5 with SMTP id qa5so52462703pdb.0
 for <linux-mtd@lists.infradead.org>; Thu, 28 May 2015 16:41:13 -0700 (PDT)
Date: Thu, 28 May 2015 16:41:04 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: =?iso-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Subject: Re: [PATCH 1/2] serve_image: do not include error.h
Message-ID: <20150528234104.GA2878@ld-irv-0074>
References: <1429908707-12537-1-git-send-email-joerg.krause@embedded.rocks>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1429908707-12537-1-git-send-email-joerg.krause@embedded.rocks>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Apr 24, 2015 at 10:51:46PM +0200, Jörg Krause wrote:
> serve_image does not use anything from it and it is not available with all
> C libraries, e.g. musl.
> 
> Signed-off-by: Jörg Krause <joerg.krause@embedded.rocks>

Pushed both to mtd-utils.git. Thanks!
