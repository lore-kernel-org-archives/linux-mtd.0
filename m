Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 153LT0-0000Tb-00
	for <linux-mtd@lists.infradead.org>; Fri, 25 May 2001 18:33:38 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3B0F0766.1080207@niisi.msk.ru> 
References: <3B0F0766.1080207@niisi.msk.ru>  <3B0EF62E.30207@niisi.msk.ru> <3B0EE338.1000701@niisi.msk.ru> <3B0E5857.636CBC17@niisi.msk.ru> <11329.990796371@redhat.com> <25506.990803856@redhat.com> <1765.990808662@redhat.com> 
To: Alexandr Andreev <andreev@niisi.msk.ru>
Cc: "linux-mtd@lists.infrared.org" <linux-mtd@lists.infradead.org>
Subject: Re: Why timer interrupt is disabled? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 25 May 2001 18:36:14 +0100
Message-ID: <11416.990812174@redhat.com>
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

andreev@niisi.msk.ru said:
> reemptively. So, we can unlock the io_request_lock in ftl.c, but what
> about double  unlocking? Or, do you want to lock it back after
> proceeding request :)  Is there any conflicts, when we try to unlock
> already unlocked lock?  

You have to lock it again before returning. 

But you really shouldn't be taking my advice on how to write block devices. 
I've been trying to avoid it :)

--
dwmw2
