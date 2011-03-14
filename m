Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PzAmI-0001kD-KV
	for linux-mtd@lists.infradead.org; Mon, 14 Mar 2011 16:37:55 +0000
Received: by fxm16 with SMTP id 16so3419265fxm.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 14 Mar 2011 09:37:53 -0700 (PDT)
Message-ID: <4D7E4437.70300@googlemail.com>
Date: Mon, 14 Mar 2011 17:37:11 +0100
From: Andre Naujoks <nautsch2@googlemail.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: gcc 4.5 and copy_flag in libubigen.c
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all.

I am compiling a board support package with mtd-utils-1.3.1.

After a gcc update to version 4.5 on my host the build fails and it
tells me that:

./src/libubigen.c: In function 'ubigen_write_leb':
./src/libubigen.c:204:19: error: operation on 'u->v->copy_flag' may be
undefined.

This seems like a recently introduced warning by the new gcc version,
but because of the -Werror halts my build.

I had a look into the source at ubi-utils/old-utils/src/libubigen.c and
it says:

int
ubigen_write_leb(ubi_info_t u, ubigen_action_t action)
{
        int rc = 0;
        size_t read = 0;

        clear_buf(u);
        write_ec_hdr(u);

        rc = fill_data_buffer_from_file(u, &read);
        if (rc != 0)
                return rc;

        if (u->v->vol_type == UBI_VID_STATIC)  {
                add_static_info(u, read, action);
        }

        u->v->lnum = cpu_to_be32(u->blks_written);

// This is the part gcc 4.5 complains about
// ---------------------

        if (action & MARK_AS_UPDATE) {
                u->v->copy_flag = (u->v->copy_flag)++;
        }

// --------------------

        write_vid_hdr(u, action);
        rc = write_to_output_stream(u);
        if (rc != 0)
                return rc;

        /* Update current handle */
        u->bytes_read += read;
        u->blks_written++;
        return 0;
}

My question is this. If this is indeed just a flag, can I just set
copy_flag to 1 instead of incrementing it? Witout breaking anything?

I found no other references to the copy_flag ecxept in this file and in
the struct definition in include/mtd/ubi-media.h. So the warning may be
right, but I really have no idea about the whole ubifs thing.

I think the -Werror in the build is intentional, so I would rather not
disable it without knowing that this is not a bug or anything.

I would really be grateful for any advice on this.

Regards and thanks in advance.
  Andre
