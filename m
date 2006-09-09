Received: from ihug-mail.icp-qv1-irony3.iinet.net.au ([203.59.1.197]
	helo=mail-ihug.icp-qv1-irony3.iinet.net.au)
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GMAtg-0007Yj-AY
	for linux-mtd@lists.infradead.org; Sat, 09 Sep 2006 23:01:59 +0100
Message-ID: <45033991.20900@redfish-group.com>
Date: Sun, 10 Sep 2006 08:00:49 +1000
From: Justin Clacherty <justin@redfish-group.com>
MIME-Version: 1.0
To: Nils Faerber <nils.faerber@kernelconcepts.de>
Subject: Re: Again 2.6.18-RC6 XScale P30 issues
References: <45018BE6.5040102@kernelconcepts.de>
	<4502A2AA.30701@redfish-group.com>
	<4502B082.1090401@kernelconcepts.de>
In-Reply-To: <4502B082.1090401@kernelconcepts.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Nils Faerber wrote:
> not the issue here. If it would be I would get the other "unable to
> write to locked sector" error.
>   
Yes, you're probably right about that.
> Instead the fs gets permanently corrupted, i.e. data is written and the
> written data is wrong.
>   
hmmm,,,didn't realise it was getting permanently corrupted.
> Last night I found that the JFFS2 write cache is configured. I will
> disable that now and see if that helps - I have the impression that the
> fs may contain half-baked stuff after a write. On the other hand, the
> JFFS2 write cache is not marked as an experimental feature so I thought
> I should be safe...
>   
Can't speak from experience here as I don't have write cache enabled, 
but I don't imagine you'd lose the whole fs if you were using write 
cache and lost power.  I suspect you'd just lose your changes or maybe 
the file that was being updated.

Justin.
