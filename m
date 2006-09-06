Received: from ihug-mail.icp-qv1-irony3.iinet.net.au ([203.59.1.197]
	helo=mail-ihug.icp-qv1-irony3.iinet.net.au)
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GKzAs-0007Ni-RC
	for linux-mtd@lists.infradead.org; Wed, 06 Sep 2006 16:18:48 +0100
Message-ID: <44FEE692.9020900@redfish-group.com>
Date: Thu, 07 Sep 2006 01:17:38 +1000
From: Justin Clacherty <justin@redfish-group.com>
MIME-Version: 1.0
To: Nicolas Pitre <nico@cam.org>
Subject: Re: Intel P30, locked sectors?
References: <44FED214.7090309@kernelconcepts.de>
	<Pine.LNX.4.64.0609061024300.18635@xanadu.home>
In-Reply-To: <Pine.LNX.4.64.0609061024300.18635@xanadu.home>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Nils Faerber <nils.faerber@kernelconcepts.de>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Nicolas Pitre wrote:
> Before the first write attempt you need to run flash-unlock on the
> corresponding flash partition.
>   
Will this work if it's your rootfs?  ie. it will need to be mounted and 
possibly written to before you get to the point where you can run 
flash-unlock.  I guess if you mount ro then there won't be any writes.

Justin.
