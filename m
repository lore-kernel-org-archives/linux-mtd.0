Date: Thu, 22 Nov 2007 18:04:29 +0000 (GMT)
From: Alexey Korolev <akorolev@infradead.org>
To: Nicolas Pitre <nico@cam.org>
Subject: Re: Very slow nor flash write
In-Reply-To: <alpine.LFD.0.99999.0711221009490.19105@xanadu.home>
Message-ID: <Pine.LNX.4.64.0711221745140.20311@pentafluge.infradead.org>
References: <497747.61534.qm@web59203.mail.re1.yahoo.com>
	<Pine.LNX.4.64.0711221405160.11563@pentafluge.infradead.org>
	<alpine.LFD.0.99999.0711221009490.19105@xanadu.home>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org, tike64 <tike64@yahoo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Nicolas,
> > It seems the problem really exists and needs to be solved. The default 
> > value of word programming timeo is defined improperly 50000usec for 
> > one word is too much - but it is not good to set it very low because 
> > inval_cache_and_wait function could return with timeo out error. The 
> > best thing would be to set default word programming time for the 
> > slowest case. I think 10KB/s would be worst enough case.
> 
> No.  You don't know if that is indeed the _absolute_ worst case, and 
> doing so just moves the problem elsewhere.
> 
> Why not simply adding a fixup entry for this particular flash model to 
> override word_write_time with the appropriate value instead?
> 
Fix up is not the best solution, because the problem will exist for every chip which do not have word programming time specified. Fixup will solve the problem for one particular part and will not fix other. 
You are right in point that setting default timeo to particular value suitable for particalur set of chips is not good as well. 
In current implementation we set up limit = timeo * 8. May be it would be better to make change here to solve the issue. If we would set up wait timeout _non less_ than some big value for chip but suitable for user it could solve the issue.If this will be  applied it won't be a problem to make default word programming time tiny. What do you think of it?
Thanks,
Alexey  
