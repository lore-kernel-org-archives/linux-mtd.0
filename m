Received: from mailsend02.psi.ch ([129.129.191.54])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JZMEp-00016C-Rb
	for linux-mtd@lists.infradead.org; Wed, 12 Mar 2008 08:23:04 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: jffs2 and 32 bit data access problem
Date: Wed, 12 Mar 2008 09:23:00 +0100
Message-ID: <1B4F8000449511488D1A640DD6DECA3501EC2614@MAILBOX0A.psi.ch>
From: "Dach Miroslaw" <miroslaw.dach@psi.ch>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,

I have had some problems mounting jffs2 file system on my NOR Flash =
(Intel TE28F640) (it is part of Avnet evaluation board with Virtex-4 =
Xilinx chip). NOR Flash is connected to the bus in a way that I can =
access data in 1 or 2 bytes mode. When I try to get 4 bytes (ie. an =
integer value) I get only first two bytes. I went through the jffs2 code =
in the linux kernel 2.6.23 and it seems to be that some structures have =
fields which refer to 'int' values:

include/linux/jffs2.h  :

typedef struct {
        uint32_t v32;
} __attribute__((packed)) jint32_t;

struct jffs2_unknown_node
{
        /* All start like this */
        jint16_t magic;
        jint16_t nodetype;
        jint32_t totlen; /* So we can skip over nodes we don't grok */
        jint32_t hdr_crc;
};

Is there some work around (in software) to get 4 bytes (jint32_t type) - =
one implicit readout of the Flash memory which refers to 2 explicit =
readouts (of two bytes each) of Flash.

Best Regards

Miroslaw Dach
