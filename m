Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15M91Q-0007u9-00
	for <linux-mtd@lists.infradead.org>; Mon, 16 Jul 2001 15:06:52 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <CD62F9B6A488D31192A900105CAB276627DF35@ETI01> 
References: <CD62F9B6A488D31192A900105CAB276627DF35@ETI01> 
To: David Mackay <dave.mackay@monitoreurope.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS (2) - File locking 
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 8bit
Date: Mon, 16 Jul 2001 15:12:11 +0100
Message-ID: <21677.995292731@redhat.com>
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

dave.mackay@monitoreurope.com said:
>  Currently on Ext2 our program uses the system call lockf() which
> works well, however we read with interest that JFFS does not support
> hard links and may have a problem with this call!!? Any comments?  

File locking doesn't involve the underlying filesystem, I believe - at 
least not for non-networked file systems. File locking on JFFS and JFFS2 
should just work.

Hard links are a completely separate issue. JFFS doesn't support them. 
JFFS2 does.

--
dwmw2
