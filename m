Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16GPiM-0004ok-00
	for <linux-mtd@lists.infradead.org>; Tue, 18 Dec 2001 19:15:46 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1008703371.12999.0.camel@timmy> 
References: <1008703371.12999.0.camel@timmy> 
To: Russ Dill <Russ.Dill@asu.edu>
Cc: linux-mtd@lists.infradead.org
Subject: Re: semi-raw access to flash 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 18 Dec 2001 19:26:27 +0000
Message-ID: <23052.1008703587@redhat.com>
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

Russ.Dill@asu.edu said:
> I'm trying to get semi-raw access to flash in userspace. I'd like to
> be able to mmap the flash and write to it (with mtd handling the
> unlock commands) but not have mtd automatically cache and erase
> blocks, etc for me.

Why? What are you trying to achieve? 

--
dwmw2
