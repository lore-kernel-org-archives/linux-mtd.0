Received: from smtp.nokia.com ([131.228.20.173] helo=mgw-ext14.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HVnns-0001Si-Bp
	for linux-mtd@lists.infradead.org; Mon, 26 Mar 2007 07:56:02 -0400
Message-ID: <4607B47D.5080009@nokia.com>
Date: Mon, 26 Mar 2007 14:54:37 +0300
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: ext David Woodhouse <dwmw2@infradead.org>
Subject: Re: JFFS2: BUG: sleeping function called from invalid context
References: <45FFBCC6.8010800@nokia.com> <4603E105.3090803@nokia.com>
	<1174661337.20505.165.camel@pmac.infradead.org>
In-Reply-To: <1174661337.20505.165.camel@pmac.infradead.org>
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

ext David Woodhouse wrote:
> Can you show that again with a full CONFIG_JFFS2_FS_DEBUG=1 log for the
> period in question?

I re-ran it but got a different error.  I have put the output in

/home/ahunter/jffs2-soft-lockup.txt

on git.infradead.org

NB it is 47 Meg - please delete it when/if you don't need it anymore

I will reproduce the original error and post it too.
