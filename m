Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CKChN-0001jt-Ru
	for linux-mtd@lists.infradead.org; Wed, 20 Oct 2004 05:24:03 -0400
Message-ID: <41762E91.8060204@yandex.ru>
Date: Wed, 20 Oct 2004 13:23:29 +0400
From: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
References: <OF9C244FBD.F36AE939-ON85256F31.00585A10-85256F31.005A79E1@nanometrics.ca>	<200410192016.02411.vestby@alfanett.no>
	<1098211369.3872.14.camel@baythorne.infradead.org>
In-Reply-To: <1098211369.3872.14.camel@baythorne.infradead.org>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 behaviour when large number of files are created.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I also don't see any other reason why the mount is much slower if there 
are directories with many files in the file system. The only reason I 
see is (what David said) that direntries are stored (in RAM) in the 
lists, and it is relatively slow operation to find/insert/delete 
direntries from the list. Instead, nodes are stored in RB-tees. So, in 
case of slow CPU, there may be significant difference.

David, If you mean inode checkpoints saying "snapshots", I don't think 
they help to increase the mount time (But! They will increase the first 
directory access delay!). If you mean what Ferenc is implementing, this 
will increase the mount speed, but file system with "large" directories 
will be mounted slower anyway ( IMHO, of course :-) ).


David Woodhouse wrote:
> On Tue, 2004-10-19 at 20:16 +0200, Jan Vestby wrote:
> 
>>I have seen startup time is quite nonlinear with respect to the number of 
>>files per directory. You could try to restrict the size of directories.
> 
> 
> Hm. Should we be using rbtrees for dirents too? Or will the snapshots
> fix this anyway?

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
