From: David Woodhouse <dwmw2@infradead.org>
To: simon@baydel.com
In-Reply-To: <6971771D4E8E@baydel.com>
References: <4034E8ED.5757.55A2D9@localhost> <69481CB84E71@baydel.com>
	 <1077632578.7826.415.camel@hades.cambridge.redhat.com>
	 <6971771D4E8E@baydel.com>
Content-Type: text/plain
Message-Id: <1077634573.7826.449.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Tue, 24 Feb 2004 14:56:14 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 Corruption.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-02-24 at 14:25 +0000, Simon Haynes wrote:
> /smc is mounted read only and I cannot write to it.
> 
> surely this is the same as not remounting root read write ?

Hmmm. What happens if you mount -oremount,rw?

-- 
dwmw2
