From: David Woodhouse <dwmw2@infradead.org>
To: Joan Dyer <joandy@us.ibm.com>
In-Reply-To: <OF34791286.BF457C19-ON85256DF1.0068ECB2-85256DF1.006A57CA@us.ibm.com>
References: 
	<OF34791286.BF457C19-ON85256DF1.0068ECB2-85256DF1.006A57CA@us.ibm.com>
Content-Type: text/plain
Message-Id: <1070557946.29624.105.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Thu, 04 Dec 2003 17:12:27 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Probs with port to 2.4.18
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2003-12-03 at 14:23 -0500, Joan Dyer wrote:
> However what seems to be the underlying problem is a non-coordinated 
> write, while/during erase.   With my port, wbuf.c (which references the 
> erase_completion lock) is not used. 
> 
> Should I protect the write in writev.c with a call on the lock? 

No. You should not read, write or erase the flash with the
erase_completion_lock spinlock held. The underlying flash driver is
expected to deal with concurrent access for itself.

-- 
dwmw2
