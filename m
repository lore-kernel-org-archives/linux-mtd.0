Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CN9U2-0008KI-Oe
	for linux-mtd@lists.infradead.org; Thu, 28 Oct 2004 08:34:31 -0400
Message-ID: <4180E732.70608@yandex.ru>
Date: Thu, 28 Oct 2004 16:33:54 +0400
From: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
References: <417F961A.1090107@yandex.ru>	
	<1098881953.13633.1786.camel@hades.cambridge.redhat.com>	
	<417FA408.9080906@yandex.ru>
	<1098884706.13633.1791.camel@hades.cambridge.redhat.com>
In-Reply-To: <1098884706.13633.1791.camel@hades.cambridge.redhat.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 & SMP
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I have two problems with JFFS2 now.

The first problem appears if SMP is enabled. I described is in the mtd-list.

The second one is the CRC errors. I also mentioned it

I've installed 4 variants of the Linux-2.6.8.1 kernel on my i686 test host:
1. SMP, Preemption
2. SMP, No preemption
3. UP, Preemption
4. UP, No preemption

I've testes JFFS2 on all these configurations and have observed:
The first problem appears only on configurations 1 and 2.
The second problem appears only on configuration 1 and 3

The configuration number 4 has no problems.

So I may suppose that:
1. The first problem is SMP-related.
2. The second problem is preemption-related.
3. Both problems relate to race conditions.

Comments?

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
