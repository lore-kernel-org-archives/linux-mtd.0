From: grante@visi.com (Grant Edwards)
Date: Fri, 14 Feb 2003 17:20:55 -0600
Subject: Problems with BIG_ENDIAN
In-Reply-To: <20030214170359.A16219@visi.com>; from grante@visi.com on Fri, Feb 14, 2003 at 05:04:00PM -0600
References: <3DF38B3E.CD3CA322@imc-berlin.de> <20030214162819.A15729@visi.com> <20030214170359.A16219@visi.com>
Message-ID: <20030214172053.A16848@visi.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

--G4iJoqBmSsgzjUCe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 14, 2003 at 05:04:00PM -0600, Grant Edwards wrote:

> > > I am having trouble creating a big endian image with the latest
> > > CVS version of mkfs.jffs2!
> [...]
> > > Both options -l _and_ -b result in the same byteorder!!!
> > 
> > Yup.  And it looks like it's still that way.  Oddly, a comment
> > at the top of the file says that cross-endian support has been
> > added, but it sure looks like "-l" and "-b" are just ignored.
> > 
> > I tried undefining JFFS2_NATIVE_ENDIAN and defining
> > JFFS2_BIG_ENDIAN, but then nothing builds.  (RH7.3 IA32 host)

Attached is a patch that makes the utils build properly if
JFFS2_BIG_ENDIAN is selected.  No idea if it breaks anything
else....

-- 
Grant Edwards
grante at visi.com

--G4iJoqBmSsgzjUCe
Content-Type: text/plain; charset=us-ascii
Content-Description: bigendianutils.patch
Content-Disposition: attachment; filename="mtdutil.patch"

--- mtd-orig/include/linux/jffs2.h	Wed Jan 22 17:00:08 2003
+++ mtd/include/linux/jffs2.h	Fri Feb 14 17:17:12 2003
@@ -96,16 +96,21 @@
 #define cpu_to_je16(x) ((jint16_t){x})
 #define cpu_to_je32(x) ((jint32_t){x})
 #define cpu_to_jemode(x) ((jmode_t){os_to_jffs2_mode(x)})
 
 #define je16_to_cpu(x) ((x).v16)
 #define je32_to_cpu(x) ((x).v32)
 #define jemode_to_cpu(x) (jffs2_to_os_mode((x).m))
 #elif defined(JFFS2_BIG_ENDIAN)
+#include <netinet/in.h>
+#define cpu_to_be16(x) htons(x)
+#define cpu_to_be32(x) htonl(x)
+#define be16_to_cpu(x) ntohs(x)
+#define be32_to_cpu(x) ntohl(x)
 #define cpu_to_je16(x) ((jint16_t){cpu_to_be16(x)})
 #define cpu_to_je32(x) ((jint32_t){cpu_to_be32(x)})
 #define cpu_to_jemode(x) ((jmode_t){cpu_to_be32(os_to_jffs2_mode(x))})
 
 #define je16_to_cpu(x) (be16_to_cpu(x.v16))
 #define je32_to_cpu(x) (be32_to_cpu(x.v32))
 #define jemode_to_cpu(x) (be32_to_cpu(jffs2_to_os_mode((x).m)))
 #elif defined(JFFS2_LITTLE_ENDIAN)

--G4iJoqBmSsgzjUCe--
