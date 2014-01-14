Received: from mail-ee0-x244.google.com ([2a00:1450:4013:c00::244])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W2u6v-00063h-N3
 for linux-mtd@lists.infradead.org; Tue, 14 Jan 2014 02:52:14 +0000
Received: by mail-ee0-f68.google.com with SMTP id c41so546274eek.7
 for <linux-mtd@lists.infradead.org>; Mon, 13 Jan 2014 18:51:50 -0800 (PST)
MIME-Version: 1.0
Date: Tue, 14 Jan 2014 03:51:50 +0100
Message-ID: <CAEwL26xsAe+x0NS5XQmp3wL_tyG_0fbXC6PfaPCtjFFFB+pOCA@mail.gmail.com>
Subject: UBIFS data integrity
From: rcrb rcrb <rcrbsw@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I have a question concerning data integrity of UBIFS.
I am considering using a database over UBIFS on my embedded device.
The database file is approximately 1 MiB. I wonder if I can rely on
the filesystem to be sure than this file will never have a corruption,
even in case of power cut during update. Will the filesystem guarantee
that, after reboot, the file will be either in the pre-update state or
be correctly updated ?

I am asking this because I read that UBIFS can have partially updated
files in case of power-cut during creation of a new file, and I am
wondering if it is the same for already existing files.

Best regards,
