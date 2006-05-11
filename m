Received: from wr-out-0506.google.com ([64.233.184.236])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FeDx2-0006Z8-Jt
	for linux-mtd@lists.infradead.org; Thu, 11 May 2006 12:23:50 -0400
Received: by wr-out-0506.google.com with SMTP id 67so424650wri
	for <linux-mtd@lists.infradead.org>;
	Thu, 11 May 2006 09:23:43 -0700 (PDT)
Message-ID: <a3cf34de0605110900u3ea9d968ld1ff81abe22bc9e4@mail.gmail.com>
Date: Thu, 11 May 2006 12:00:31 -0400
From: sebrlw@gmail.com
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Subject: Raw node error
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm getting the following message repeated in my syslog.

    Raw node at 0x01c622c0 wasn't in node lists for ino #46

The system boots okay, but once my main application starts this
message is repeated hundreds of times.  This is a remote system and
debugging will not be easy.  At this point I'm trying to develop a
strategy, so any info will be helpful.

The system is a XScale with JFFS2 on strata flash using kernel 2.4.19.
 I'm hoping someone can provide me with an understanding of what the
error message means.

SEB
