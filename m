Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QJiJH-0008QJ-A1
	for linux-mtd@lists.infradead.org; Tue, 10 May 2011 08:28:52 +0000
Received: by wyb28 with SMTP id 28so5663244wyb.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 10 May 2011 01:28:48 -0700 (PDT)
Message-ID: <4DC8F73A.1070708@gmail.com>
Date: Tue, 10 May 2011 10:28:42 +0200
From: angelo <angelo70@gmail.com>
MIME-Version: 1.0
To: linux-net@vger-kernel.org,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Coldfire, d9000e and patch RFC
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: uClinux development list <uclinux-dev@uclinux.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

some months ago i posted to these lists (net, m68k) a patch.

http://marc.info/?l=linux-m68k&m=129447772217552&w=2 
<http://marc.info/?l=linux-m68k&m=129447772217552&w=2>

I did a small job to allow dm9000e to be used with a Coldfire processor, 
and for the functional point of view the patch works fine.

I never get the patch approved or a reply to this PATCH V.3 with the 
reason that explain why cannot be approved, but i am really interested 
that this job don't remain to me only, some other could need the ability 
to use the dm9000e chip, a quiet old but very cheap component, with 
Coldfire.
The patch should probably be reworked in a different way, please let me 
know if i have to arrange the code in a different way, of if some other 
information are needed.

Regards,
Angelo Dureghello
