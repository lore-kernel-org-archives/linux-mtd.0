Received: from mail-pb0-x236.google.com ([2607:f8b0:400e:c01::236])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WWJuo-0006Pp-Nc
 for linux-mtd@lists.infradead.org; Sat, 05 Apr 2014 06:17:19 +0000
Received: by mail-pb0-f54.google.com with SMTP id ma3so4403746pbc.13
 for <linux-mtd@lists.infradead.org>; Fri, 04 Apr 2014 23:16:52 -0700 (PDT)
Date: Fri, 4 Apr 2014 23:16:21 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Ron <ron@debian.org>
Subject: Re: [PATCH 1/2] Fix index regression in nand_read_subpage
Message-ID: <20140405061621.GA3131@norris-Latitude-E6410>
References: <1394904668-22978-1-git-send-email-ron@debian.org>
 <1394904668-22978-2-git-send-email-ron@debian.org>
 <20140331165642.GE29542@ld-irv-0074>
 <CAGVrzcadyo5S3YOTQnMzijjcBM+9qM3tihARU2ur7JV_nmeFpQ@mail.gmail.com>
 <20140402055806.GL20439@audi.shelbyville.oz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140402055806.GL20439@audi.shelbyville.oz>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Florian Fainelli <f.fainelli@gmail.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Apr 02, 2014 at 04:28:07PM +1030, Ron wrote:
>  Signed-off-by: Ron Lee <ron@debian.org>

Thanks. Pushed the first one to l2-mtd.git (should go out for 3.15, I
think), but I'll leave the other trivial one for later.

Thanks,
Brian
