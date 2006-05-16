Received: from wr-out-0506.google.com ([64.233.184.236])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Fg3Tx-00020X-AU
	for linux-mtd@lists.infradead.org; Tue, 16 May 2006 13:37:22 -0400
Received: by wr-out-0506.google.com with SMTP id i21so24918wra
	for <linux-mtd@lists.infradead.org>;
	Tue, 16 May 2006 10:37:06 -0700 (PDT)
Message-ID: <a3cf34de0605161037x2ebff8a3w3b85dbd52d1bba6f@mail.gmail.com>
Date: Tue, 16 May 2006 13:37:03 -0400
From: sebrlw@gmail.com
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Subject: Strange "raw node error"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm receiving the following message in my syslog.

   Raw node at 0x01c622c0 wasn't in node lists for ino #46

I'd like to know what might cause this problem.  I have looked at the
driver source code, but it is not obvious to me what causes the error
to occur.

The system is a XScale with JFFS2 on strata flash using kernel 2.4.19.
 I'm hoping someone can provide me with an understanding of what the
error message means.

SEB
