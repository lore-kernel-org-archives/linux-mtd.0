Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17AB8V-0006CH-00
	for <linux-mtd@lists.infradead.org>; Tue, 21 May 2002 16:01:15 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <EFEAIMDCOOOHIEPHDNFJIELDDPAA.stefan.roese@esd-electronics.com> 
References: <EFEAIMDCOOOHIEPHDNFJIELDDPAA.stefan.roese@esd-electronics.com> 
To: "Stefan Roese" <stefan.roese@esd-electronics.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: SST Flash Support (SST39VF160) 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 21 May 2002 16:00:58 +0100
Message-ID: <10014.1021993258@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

stefan.roese@esd-electronics.com said:
>  I am right now struggeling with mtd and sst flash chips (39VF160)
> support. The amd devices (am29lv160) work without problems.

SST 39VF160 chips are CFI-compliant. You shouldn't need any special code 
for them -- just use cfi_probe.

--
dwmw2
