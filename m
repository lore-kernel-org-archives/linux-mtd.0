From: David Woodhouse <dwmw2@infradead.org>
To: Sreecharan Sivadevuni <mailsreecharan@yahoo.co.uk>
In-Reply-To: <20060518082710.79870.qmail@web27309.mail.ukl.yahoo.com>
References: <20060518082710.79870.qmail@web27309.mail.ukl.yahoo.com>
Content-Type: text/plain
Date: Thu, 18 May 2006 12:46:03 +0100
Message-Id: <1147952763.3875.59.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Jffs2 reports "Warning: DQ5 raised while program ...",
	Contiuously!
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2006-05-18 at 08:27 +0000, Sreecharan Sivadevuni wrote:
>          I am running JFFS2.1 on uClinux2.4.24. My flash chip is
> SST39VF6401B. For all Write/erase/ (and may be also read) operations,
> the MTD drivers print the following warning message.  
>  "Warning: DQ5 raised while program operation was in progress, however
> operation completed OK"

Try updating to version 1.65 from CVS. I'm very wary of actually
updating the 2.4 tree with that, though.

-- 
dwmw2
