Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14vLh8-00014j-00
	for <linux-mtd@lists.infradead.org>; Thu, 03 May 2001 17:11:10 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <01C0D3F1.55B02480.chris.read@activesilicon.co.uk> 
References: <01C0D3F1.55B02480.chris.read@activesilicon.co.uk> 
To: "chris.read@activesilicon.co.uk" <chris.read@activesilicon.co.uk>
Cc: "Mtd (E-mail)" <linux-mtd@lists.infradead.org>
Subject: Re: Wear Leveling in JFFS2 NOT working!(?) 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 03 May 2001 17:09:04 +0100
Message-ID: <4072.988906144@redhat.com>
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


chris.read@activesilicon.co.uk said:
> There are applications where a deeply embedded system may get power
> cycled  frequently; thus I would advocate that wear levelling should
> work correctly  in this case.

We know how. Just that nobody's provided me with a patch or sufficient 
motivation to do it myself yet :)

--
dwmw2
