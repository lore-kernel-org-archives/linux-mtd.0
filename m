Received: from wproxy.gmail.com ([64.233.184.196])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1Ex0Qg-0005Fm-1l
	for linux-mtd@lists.infradead.org; Thu, 12 Jan 2006 06:15:52 -0500
Received: by wproxy.gmail.com with SMTP id i1so366156wra
	for <linux-mtd@lists.infradead.org>;
	Thu, 12 Jan 2006 03:15:41 -0800 (PST)
Message-ID: <29f916510601120315t72e6c529p918e491287ffdcf0@mail.gmail.com>
Date: Thu, 12 Jan 2006 06:15:41 -0500
From: alfred hitch <alfred.hitch@gmail.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Subject: locked flash bits handling
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

If my flash blocks are locked and someone tries to write to those blocks.
I see an error returned back saying
Not marking space as dirty XXXX flash driver returned retlen zero.

So does it means that mtd code doesnt happens to handle the lock'ing
and unlocking of flash blocks when user plane wants to write back ?

In my case flash is Intel J3 ver C and reason for locking is to
prevent and accidental hardware errors / reset related flahs
corruptions.

So, for some specific user plane segments, we would have liked to
accept user writting as acceptable valid writes. So, was wondering on
2 options:
1) Why wouldn't MTD handle this ?  any option / patch available to do so ?
2) From user plane cp A B  for example, I  will have to unlock , then
issue copy command and then lock.
As I dont know which flash sector / block it will be for destination
file at user level. I cannot unlock that block specifcally ?

Regards,
Alfred
