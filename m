Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16VL2A-00015l-00
	for <linux-mtd@lists.infradead.org>; Mon, 28 Jan 2002 23:17:54 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <D3A72C5007329A4F991C0DD87202259F096A3E@sekhmet.ad.newisys.com> 
References: <D3A72C5007329A4F991C0DD87202259F096A3E@sekhmet.ad.newisys.com> 
To: "Navin Boppuri" <navin.boppuri@newisys.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: linux/completion.h missing 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 28 Jan 2002 23:28:54 +0000
Message-ID: <29911.1012260534@redhat.com>
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

navin.boppuri@newisys.com said:
> There is a missing file that jffs2_fs_sb.h looks for and does not
> find. The file name is completion.h which is supposed to be in the
> include/linux/ directory. I have the latest 2.4. kernel and I dont see
> this file. What's going on? Where do I get this? 

It's been there since 2.4.7-pre7. Your kernel tree is missing some files or 
you lied about it being the latest.


--
dwmw2
