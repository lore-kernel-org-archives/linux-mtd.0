From: David Woodhouse <dwmw2@infradead.org>
To: Kalev Lember <kalev@colleduc.ee>
In-Reply-To: <Pine.LNX.4.44.0404011658150.6508-100000@kiire.colleduc.ee>
References: <Pine.LNX.4.44.0404011658150.6508-100000@kiire.colleduc.ee>
Content-Type: text/plain
Message-Id: <1080830176.24117.1858.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Thu, 01 Apr 2004 15:36:17 +0100
Content-Transfer-Encoding: 7bit
cc: gerg@snapgear.com
cc: linux-mtd@lists.infradead.org
Subject: Re: Bad blocks
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2004-04-01 at 17:06 +0300, Kalev Lember wrote:
> Hi,
> 
> I am going to use DOC Millennium Plus and I do not want to use M-Systems 
> propietary kernel modules.
> Having read the mailing list archives I have some questions.  Does current 
> INFTL code support bad block handling? Without that I would say it is 
> virtually useless. Am I correct?

It doesn't, and you're probably correct, yes.

This is fairly high up on my TODO list but keeps getting preempted by
RealWork(tm). Are you volunteering? It shouldn't be too hard.

-- 
dwmw2
