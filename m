Received: from fg-out-1718.google.com ([72.14.220.154])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OPDRq-0004Oz-OG
	for linux-mtd@lists.infradead.org; Thu, 17 Jun 2010 11:39:55 +0000
Received: by fg-out-1718.google.com with SMTP id e21so1573511fga.0
	for <linux-mtd@lists.infradead.org>;
	Thu, 17 Jun 2010 04:39:51 -0700 (PDT)
MIME-Version: 1.0
Sender: foxcore@gmail.com
In-Reply-To: <201006171323.38152.fabio.giovagnini@aurion-tech.com>
References: <201006171323.38152.fabio.giovagnini@aurion-tech.com>
From: Guillaume LECERF <glecerf@gmail.com>
Date: Thu, 17 Jun 2010 13:39:31 +0200
Message-ID: <AANLkTimdCaGHZUxhpp7nfuqrTRmT4rVzEGvVRLYyWzKQ@mail.gmail.com>
Subject: Re: SST39VF6402B kernel compatibility
To: Fabio Giovagnini <fabio.giovagnini@aurion-tech.com>
Content-Type: text/plain; charset=UTF-8
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2010/6/17 Fabio Giovagnini <fabio.giovagnini@aurion-tech.com>:
> Hi All,

Hi Fabio,

> I'm building Linux version 2.6.35-rc2+ for sh27203.
> Is this release full compliant with SST39VF6402B or do I need more over
> patches?

This should be OK (
http://git.infradead.org/mtd-2.6.git/commitdiff/5a0563f0ad0c9864b735e9ae23e55f7fa9c73bf5
)
But I would appreciate your confirmation on this, just to be sure.

-- 
Guillaume LECERF
GeeXboX developer - www.geexbox.org
