Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16C1X8-0003ep-00
	for <linux-mtd@lists.infradead.org>; Thu, 06 Dec 2001 16:38:02 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1007656389.1783.18.camel@keller> 
References: <1007656389.1783.18.camel@keller> 
To: "Georg Nikodym" <georgn@somanetworks.com>
Cc: linux-mtd@lists.infradead.org, fgiasson@mediatrix.com,
    linux-arm@lists.arm.linux.org.uk
Subject: Re: [Fwd: Re: 2.4.16-rmk1 patch file] 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 06 Dec 2001 16:48:37 +0000
Message-ID: <1190.1007657317@redhat.com>
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

georgn@somanetworks.com said:
> I sent the attached to the ARM kernel list because of a ^M the
> official ARM architecture and Russell says that it's actually in the
> MTD CVS...

> -        struct jffs2_raw_node_ref *this;
> +        struct jffs2_raw_node_ref *this;               ^M


Fixed. Thanks. 

/me stares hard at fgiasson. :)

--
dwmw2
