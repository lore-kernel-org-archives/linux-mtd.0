From: David Woodhouse <dwmw2@infradead.org>
To: Shen Aaron-r62966 <Aaron.Shen@motorola.com>
In-Reply-To: <01139FC052A0D411900B00508B9535FC102796E7@ZCH07EXM04.corp.mot.com>
References: 
	 <01139FC052A0D411900B00508B9535FC102796E7@ZCH07EXM04.corp.mot.com>
Content-Type: text/plain
Message-Id: <1079686696.16952.218.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Fri, 19 Mar 2004 08:58:16 +0000
Content-Transfer-Encoding: 7bit
cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Re: JFFS2 Errors
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2004-03-19 at 13:35 +0800, Shen Aaron-r62966 wrote:
> Hi,
> 
>   I met some error when using JFFS2 in my new board while there's no
> problem to use cramfs file system. Actually, the problem is only these
> disgusting error messeges because the JFFS2 rootdisk can be mounted at
> last. 
> 
>   Below is the error messege, please help to see what's the cause.

You have generated a JFFS2 image with incorrect erasesize. Use
'-e0x40000' argument to JFFS2.

-- 
dwmw2
