Received: from [84.204.75.166] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.61 #1 (Red Hat Linux))
	id 1FVofZ-0007WX-DS
	for linux-mtd@lists.infradead.org; Tue, 18 Apr 2006 07:47:11 -0400
Message-ID: <4444D18E.80104@yandex.ru>
Date: Tue, 18 Apr 2006 15:46:22 +0400
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Ferenc Havasi <havasi@inf.u-szeged.hu>
References: <4444C8FD.1070406@inf.u-szeged.hu>
In-Reply-To: <4444C8FD.1070406@inf.u-szeged.hu>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: A JFFS2 optimization related to syslog
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Ferenc,

Ferenc Havasi wrote:
> Dear All,
> 
> If JFFS2 is used as root filesystem, syslogd/klogd can cause problems,
> because every log line are written out individually, so the log file
> will contain a lot of small nodes. Because a log file can be very large
> (over 30M in our case) it can cause large memory consuption and can make
> the system very slow, especially at opening it after next reboot
> (becauseof the large frag-tree). Unforunatelly garbage collecting also
> does not help, because none of the nodes is obsocalated.
Hmm,

for this testcase you actually want to write entire page if this is the 
last page of this file. But your patch writes entire page if the current 
fragment ends at the end of page, which is different.

I mean, you probably want to do something like this instead:

if ((inode->i_size >> PAGE_CACHE_SHIFT) >= pg->index) {
     /*
      * This is the last page, so unconditionally re-write it fully.
      */
     start = 0;
}

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
