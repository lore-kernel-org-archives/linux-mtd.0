Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15ojWB-0003hb-00
	for <linux-mtd@lists.infradead.org>; Wed, 03 Oct 2001 11:44:47 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.21.0110031230510.6225-100000@lxserver.deltes.cz> 
References: <Pine.LNX.4.21.0110031230510.6225-100000@lxserver.deltes.cz> 
To: martin.kula@deltaes.cz
Cc: linux-mtd@lists.infradead.org
Subject: Re: DoC (NFTL) problem with 2.4.10-ac3 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 03 Oct 2001 11:52:29 +0100
Message-ID: <7631.1002106349@redhat.com>
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

Change the #if 1 at line 97 of nftlmount.c to #if 0


--
dwmw2
