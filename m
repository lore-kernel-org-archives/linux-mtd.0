Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15Kwig-0001qQ-00
	for <linux-mtd@lists.infradead.org>; Fri, 13 Jul 2001 07:46:34 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3B4E5085.62422401@sun.com> 
References: <3B4E5085.62422401@sun.com> 
To: Tim Hockin <thockin@sun.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: module names in request_module() 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 13 Jul 2001 07:52:13 +0100
Message-ID: <24251.995007133@redhat.com>
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

thockin@sun.com said:
>  if I depmod a module that needs cfi and cfi_probe is not loaded,
> request_module fails, because it is looking for the module named "cfi"
> not "cfi_probe". 

Does v1.9 of chipreg.c fix it correctly?

--
dwmw2
