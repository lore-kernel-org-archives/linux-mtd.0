Received: from ihug-mail.icp-qv1-irony1.iinet.net.au ([203.59.1.195]
	helo=mail-ihug.icp-qv1-irony1.iinet.net.au)
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GMBIV-0005gD-5m
	for linux-mtd@lists.infradead.org; Sat, 09 Sep 2006 23:27:36 +0100
Message-ID: <45033F93.2040204@redfish-group.com>
Date: Sun, 10 Sep 2006 08:26:27 +1000
From: Justin Clacherty <justin@redfish-group.com>
MIME-Version: 1.0
To: paul@mawsonlakes.org
Subject: Re: [Sfd] FOSS, Science, and Public activism
References: <20060701220824.1EC396B0FDD@gnu-darwin.org>
	<cc9bf44d0609071533r10bc5c5cl940088ead9669c4f@mail.gmail.com>
In-Reply-To: <cc9bf44d0609071533r10bc5c5cl940088ead9669c4f@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "proclus@gnu-darwin.org" <proclus@gnu-darwin.org>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Paul Schulz wrote:
> Rather than make use of the mtd drivers for Linux (for whatever reason), they
> ship their own binary flash modules for Linux. This is used by both
> the bootloader
> and the modified linux kernel. This makes is (nearly) impossible to look into
> various hardware  related issues on this platform eg.
>   
Had some problems with this myself.  The proprietary boot loader is 
annoying...

I believe they've open sourced the mtd driver now in this "[PATCH 04/06] 
CM-x2xx: MTD" patch to the arm-linux list.

Justin.
