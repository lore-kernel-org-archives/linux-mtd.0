Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16TfmT-0001Q6-00
	for <linux-mtd@lists.infradead.org>; Thu, 24 Jan 2002 09:02:49 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1011862654.27784.0.camel@pcjonashg> 
References: <1011862654.27784.0.camel@pcjonashg>  <200201240304.g0O349RM018586@krynn.axis.se> 
To: Jonas Holmberg <jonas.holmberg@axis.com>
Cc: jmzhong@dtvia-usoft.com, jffs-dev@axis.com,
    linux-mtd@lists.infradead.org
Subject: Re: How to understand :interleave,numeraseregions and regions 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 24 Jan 2002 09:13:48 +0000
Message-ID: <22450.1011863628@redhat.com>
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

jonas.holmberg@axis.com said:
>  I would like to ask the MTD people why it's necessary to have a
> variable for device_type? Isn't it always possible to calculate the
> device_type (buswidth / interleave)? 

You can use 16-bit devices in 8-bit mode. And it matters. 

--
dwmw2
