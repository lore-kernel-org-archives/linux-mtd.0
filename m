Received: from mail-pd0-x22b.google.com ([2607:f8b0:400e:c02::22b])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VqJTg-0000pl-EB
 for linux-mtd@lists.infradead.org; Tue, 10 Dec 2013 09:19:41 +0000
Received: by mail-pd0-f171.google.com with SMTP id z10so6948969pdj.30
 for <linux-mtd@lists.infradead.org>; Tue, 10 Dec 2013 01:19:18 -0800 (PST)
MIME-Version: 1.0
Date: Tue, 10 Dec 2013 17:19:18 +0800
Message-ID: <CAGngVe3ken7Ohm8OhjrnsdBZRg0zaXkQrGREycAOM3ctN2pzJQ@mail.gmail.com>
Subject: JFFS2 partition full issue
From: bon chen <bonapply@gmail.com>
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

Hi there,

We met a failure for writing date to jffs2 partition,
but the partition is shown not full via "df".

Sometimes, the embdedded system run overnight,
when cp some file to JFFS2 partition we found bellow message
"cp: can't create '/xxx/xxx: No space left on device"


found that if the message "Newly-erased block contained word xxxx at
offset xxxx" happened once,
then no longer to write date to  jffs2 partition partition, only
reboot system could recover.

trace the kernel code, the message is printed in
kernel/ti/linux-2.6.39.3/src/fs/jffs2/erase.c
===
static int jffs2_block_check_erase(struct jffs2_sb_info *c, struct
jffs2_eraseblock *jeb, uint32_t *bad_offset)
{
...
for (i=0; i<readlen; i += sizeof(unsigned long)) {
/* It's OK. We know it's properly aligned */
unsigned long *datum = ebuf + i;
if (*datum + 1) {
*bad_offset += i;
printk(KERN_WARNING "<2>Newly-erased block contained word 0x%lx at
offset 0x%08x\\n", *datum, *bad_offset);
ret = -EIO;
goto fail;
}
}

...
}
===

Are there any patch or solution to fix this issue ?

Thanks in advance.
Jonathan
