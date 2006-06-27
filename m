Received: from ug-out-1314.google.com ([66.249.92.170])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FvItv-0005cb-Cq
	for linux-mtd@lists.infradead.org; Tue, 27 Jun 2006 15:07:17 -0400
Received: by ug-out-1314.google.com with SMTP id q2so2136844uge
	for <linux-mtd@lists.infradead.org>;
	Tue, 27 Jun 2006 12:07:04 -0700 (PDT)
From: Husam <husamsenussi@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: mtdconcat
Date: Tue, 27 Jun 2006 20:07:06 +0100
References: <200606262324.28262.husamsenussi@gmail.com>
	<1151416218.17609.142.camel@hades.cambridge.redhat.com>
In-Reply-To: <1151416218.17609.142.camel@hades.cambridge.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200606272007.06983.husamsenussi@gmail.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thanks I thought I would need to load this as separate driver


On Tuesday 27 June 2006 14:50, David Woodhouse wrote:
> grep mtd_concat_create -r drivers/mtd/maps
